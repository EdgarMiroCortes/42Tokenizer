# code/

Aquí va el **código fuente del smart contract** del token.

Antes de implementar: lee [BEP20-vs-ERC20.md](./BEP20-vs-ERC20.md) para elegir estándar y red.

Contrato del token: [Fortytwoken42.sol](./Fortytwoken42.sol)  
Manual Remix: [../documentation/05-manual-remix.md](../documentation/05-manual-remix.md)

## Qué debe haber

- Contrato del token (BEP-20 o ERC-20 según la chain).
- Código **comentado** y con nombres de variables/funciones claros.
- Si usas Hardhat/Truffle: también `contracts/`, tests, `package.json`, etc.

## Checklist

- [x] Nombre del token contiene `42` (`fortytwoken42`)
- [x] Cumple el estándar de la chain (BEP-20 vía interfaz ERC-20 / OpenZeppelin)
- [x] Ownership / privilegios pensados y documentados (`documentation/03-security.md`)
- [ ] Listo para code review en la evaluación (ensayar: qué hace `ERC20`, `_mint`, por qué no hay `Ownable`)

## Nota

No uses mainnet ni fondos reales. Trabaja siempre en testnet.
