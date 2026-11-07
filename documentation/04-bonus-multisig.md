# 04 — Bonus: Multisig (opcional)

> Solo se evalúa si la parte **mandatory está perfecta** (completa y sin fallos).

## Objetivo

Añadir un sistema **multisignature**: varias partes deben firmar antes de ejecutar una acción sensible (por ejemplo mint, cambio de owner, o transferencias privilegiadas).

## Diseño propuesto

| Campo | Valor |
|-------|-------|
| Firmantes autorizados | `[TODO: N addresses]` |
| Umbral (M de N) | `[TODO: ej. 2 de 3]` |
| Acciones protegidas | `[TODO: mint / withdraw / changeOwner…]` |
| Relación con el token | `[TODO: owner = contrato multisig]` |

## Cómo demostrarlo

1. Proponer una acción desde el multisig
2. Recoger las firmas necesarias
3. Ejecutar solo cuando se alcanza el umbral
4. Mostrar en explorer las transacciones asociadas

## Estado

- [x] **No implementado** (el subject solo evalúa el bonus si lo mandatory está perfecto)
- [ ] Implementado y documentado
- [ ] Probado en testnet
