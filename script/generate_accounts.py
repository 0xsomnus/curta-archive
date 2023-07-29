import sys
from web3 import Web3
from eth_account import Account

def create_eth_accounts(num_accounts):
    for _ in range(num_accounts):
        acct = Account.create()
        print(f"Address: {acct.address}")
        print(f"Private Key: {acct.key.hex()}")
        print()

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 generate_accounts.py <number_of_accounts>")
        sys.exit(1)
        
    num_accounts = int(sys.argv[1])
    create_eth_accounts(num_accounts)
