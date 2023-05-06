program a.aleo {


    record token {
        // The owner.
        owner: address,
        
        gates: u64,
        // The token amount.
        amount: u64,
    }

   

    
    transition mint_public(public receiver: address, public amount: u64) -> token {
        // Mint the tokens publicly by invoking the computation on-chain.
        return token {
            owner: receiver,
            gates: 0u64,
            amount: amount,
        };
    }

    
    transition mint_private(receiver: address, amount: u64) -> token {
        return token {
            owner: receiver,
            gates: 0u64,
            amount: amount,
        };
    }

    
    transition transfer_public(public sender: token, public receiver: address, public amount: u64) -> (token, token) {


        let difference: u64 = sender.amount - amount;

        
        let remaining: token = token {
            owner: sender.owner,
            gates: sender.gates,
            amount: difference,
        };

        
        let transferred: token = token {
            owner: receiver,
            gates: 0u64,
            amount: amount,
        };

        
        return (remaining, transferred);
    }

   
    transition transfer_private(sender: token, receiver: address, amount: u64) -> (token, token) {

        let difference: u64 = sender.amount - amount;

        
        let remaining: token = token {
            owner: sender.owner,
            gates: sender.gates,
            amount: difference,
        };

        
        let transferred: token = token {
            owner: receiver,
            gates: 0u64,
            amount: amount,
        };

        
        return (remaining, transferred);
    }



}
