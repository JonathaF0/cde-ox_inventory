# Changes in this fork

ox_inventory 2.48.1 by Overextended, https://github.com/overextended/ox_inventory,
licensed under the GPL-3.0 or later. See NOTICE.md and LICENSE.

| File | Change |
|---|---|
| `modules/bridge/cde/server.lua` | Added: bridge for cde-core (`inventory:framework "cde"`) |
| `modules/bridge/cde/client.lua` | Added: bridge for cde-core, client |
| `locales/en.json` | Added `cde_licence_from_cad` |
| `client.lua` | Key bindings renamed `cde_inv`, `cde_inv2`, `cde_hotbar`, so `inventory:keys` applies to players who had bound the old ones |
| `data/cde.lua` | Added: cde-core's items (ID card, fuel card, papers, drinks, drugs, test kits) |
| `modules/items/shared.lua` | Loads `data/cde.lua` after `data/items.lua` when `inventory:framework` is `cde`, skipping any item `data/items.lua` already defines |
| `web/images/` | Added: `beer`, `breathalyzer`, `citation_ticket`, `drug_swab`, `ecstasy`, `gov_id`, `joint`, `licence_card`, `oxy`, `vehicle_registration`, `vodka`, `whiskey`, `wine`, `fuel_card` |
| `.github/workflows/upstream-sync.yml` | Added: opens a pull request for each new ox_inventory release |
