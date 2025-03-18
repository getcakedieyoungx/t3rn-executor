# t3rn-executor auto install

This script automates the installation and setup of the **t3rn Executor** on Linux. With a single command, you can download, configure, and start the executor.



## 📥 Installation & Usage

1. Open Screen
   ```bash
   screen -S t3rn
   ```

1.1 Clone this repository:
   ```bash
   git clone https://github.com/getcakedieyoungx/t3rn-executor.git
   cd t3rn-executor
   ```

2. Run the setup script:
   ```bash
   bash install_t3rn_executor.sh
   ```

3. Enter your private key when prompted.

4. The executor will be installed, configured, and started automatically!

5. CTRL A+D After start

## 🔧 Environment Variables

The script sets up the following environment variables:

| Variable | Description |
|----------|-------------|
| `ENVIRONMENT` | Set to `testnet` |
| `LOG_LEVEL` | Set to `debug` |
| `LOG_PRETTY` | Set to `false` |
| `EXECUTOR_PROCESS_BIDS_ENABLED` | `true` |
| `EXECUTOR_PROCESS_ORDERS_ENABLED` | `true` |
| `EXECUTOR_PROCESS_CLAIMS_ENABLED` | `true` |
| `EXECUTOR_MAX_L3_GAS_PRICE` | `100` (gwei) |
| `PRIVATE_KEY_LOCAL` | User-provided private key |
| `ENABLED_NETWORKS` | `arbitrum-sepolia,base-sepolia,optimism-sepolia,l2rn` |
| `RPC_ENDPOINTS` | Predefined RPC endpoints |
| `EXECUTOR_PROCESS_PENDING_ORDERS_FROM_API` | `true` |

## 🚀 Running the Executor

After installation, the executor will start automatically. If you need to restart it manually:
```bash
cd ~/t3rn/executor/executor/bin
./executor
```

For background execution, use:
```bash
screen -S t3rn ./executor
```
Detach with `Ctrl + A, then D`. Reattach with:
```bash
screen -r t3rn
```

## 🛠 Troubleshooting
- Ensure your private key is valid.
- Check if `executor` is running: `ps aux | grep executor`
- Verify network connectivity.

## Join tg, I will post bots there too.
[Telegram](https://t.me/getcakedieyoungx)

### For donations:
EVM:
0xE065339713A8D9BF897d595ED89150da521a7d09

SOLANA:
CcBPMkpMbZ4TWE8HeUWyv9CkEVqPLJ5gYe163g5SR4Vf

