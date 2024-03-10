#!/usr/bin/env -S bash -euo pipefail

get_github_repo_size() {

  if [[ "$1" == "--help" || "$1" == "-h" ]]; then
    echo "Usage: get_github_repo_size [OPTIONS] {GITHUB_REPO_URLS...}"
    echo
    echo "Retrieve and display the sizes of GitHub repositories."
    echo "The function will automatically use the GITHUB_TOKEN if it's set as an environment variable."
    echo
    echo "Options:"
    echo
    echo "  -h, --help     Display this help message."
    echo
    echo "Environment variables:"
    echo
    echo "  GITHUB_TOKEN   Use the provided GitHub token for authentication."
    echo
    echo "Exit codes:"
    echo
    echo "  0              Success"
    echo "  1              Fail"
    echo
    return
  fi

  local _i
  local  _err=0
  for _i in "${@}" ; do
    local _url="${_i}"
    local _owner="$(basename "$(dirname "${_url}")")"
    local _repo="$(basename "${_url}")"
    local _domain="$(basename "$(dirname "$(dirname "${_url}")")")"
    local _api_url="https://api.${_domain}/repos/${_owner}/${_repo}"

    local _headers=""
    if [ -n "$GITHUB_TOKEN" ]; then
      # Use the provided GitHub token if available
      local _headers="-H 'Authorization: Bearer $GITHUB_TOKEN'"
    fi

    # Fetch repository info, including size, in a single request
    local _response=$(curl -sS $_headers "$_api_url")

    # Check if the GitHub repo exists
    if jq -e '.message' <<< "$_response" >/dev/null; then
      # The API response contains a message field (indicating an error)
      local _message=$(jq -r '.message' <<< "$_response")
      >&2 printf 'error %s Failed to retrieve information about the GitHub repository: %s\n' "${_domain}/${_owner}/${_repo}" "${_message:-dns or http connection error}"
      _err=1
    else
      # The GitHub repo exists; fetch and format its size
      local _size=$(jq '.size' <<< "$_response")
      if [ "$_size" != "null" ]; then
        # Valid size found; format and print it
        printf '%s %s\n' "$(numfmt --to=iec --from-unit=1024 <<< "$_size")" "${_domain}/${_owner}/${_repo}"
      else
        >&2 printf 'error %s Invalid size data retrieved.\n'  "${_domain}/${_owner}/${_repo}"
        _err=1
      fi
    fi
  done
  return ${_err}
}
