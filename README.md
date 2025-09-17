# Setup

```bash
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
echo your-mugrade-api-key > mugrade-key.txt
```

# Test
```bash
./run_test.sh <testname> <optional arguments for pytest>
```

# Submit
```bash
./run_test.sh -m <testname>
```
