# 01 — Overview

## Qué es este token

**fortytwoken42** (`TWOKEN`) es un token fungible desplegado en **BNB Smart Chain Testnet** siguiendo el estándar **BEP-20** (misma interfaz que ERC-20). Es un token de aprendizaje para el proyecto Tokenizer de 42: existe on-chain, se puede enviar y recibir, y no representa dinero real.

## Qué representa

Simboliza el trabajo del campus 42 sobre Web3: un activo de práctica para entender wallets, gas, estándares de token y explorers. No hay utilidad de producto (no es un exchange, ni un DAO, ni un medio de pago). El supply es fijo: un millón de unidades creadas en el deploy, pensado para una demo clara (balance → transfer → explorer).

## Características principales

- Nombre: **fortytwoken42**
- Símbolo (ticker): **TWOKEN**
- Decimals: **18**
- Supply: **1_000_000** (en unidades humanas; on-chain es `1_000_000 * 10^18`)
- Mintable: **no** (solo `_mint` en el constructor)
- Burnable: **no**
- Pausable: **no**
- Admin / `Ownable`: **no**

## Contratos y red

- Red: BNB Smart Chain Testnet (Chain ID **97**)
- Dirección: `0xEDEEB2a12e8ba717a0E04c2D82eEa947669CDbFF`
- Explorer: https://testnet.bscscan.com/address/0xEDEEB2a12e8ba717a0E04c2D82eEa947669CDbFF
- Código: [`code/Fortytwoken42.sol`](../code/Fortytwoken42.sol) (OpenZeppelin `ERC20`)
