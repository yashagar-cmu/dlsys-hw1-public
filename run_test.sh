set -e

if [[ "$1" == "-m" ]]; then
    MODE="m"
    INPUT="$2"
else
    MODE="normal"
    INPUT="$1"
    shift 1
fi

if [[ -z "$INPUT" ]]; then
    echo "Error: no argument provided."
    echo "Usage: $0 [-m] \"testname\""
    exit 1
fi

source "$(git rev-parse --show-toplevel)/venv/bin/activate"

if [[ "$MODE" == "m" ]]; then
    echo "Submitting to mugrade with: $INPUT"
    KEY=$(cat mugrade-key.txt)
    python3 -m mugrade submit "$KEY" hw1 -k "$INPUT"
else
    echo "Running tests locally on: $INPUT"
    python3 -m pytest -v -k "$INPUT" "$@"
fi