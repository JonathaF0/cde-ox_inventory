# Changes in this fork

This is ox_inventory 2.48.0 by Overextended
(https://github.com/overextended/ox_inventory), with a bridge for cde-core,
the CDE Framework from CDECAD. It is licensed under the GPL-3.0 or later, like
the original; see [NOTICE.md](./NOTICE.md) and [LICENSE](./LICENSE). All
copyright and attribution notices of the original are kept.

The changes, so they can be offered upstream as they are:

| File | Change |
|---|---|
| `modules/bridge/cde/server.lua` | New. Loads a character's inventory on cde-core's `playerLoaded`, saves it on `playerUnloaded`, keeps cash and the `money` item in step, takes groups from cde-core (the character's job, plus the department while on duty), answers licence checks from cde-core's copy of the CAD's licences, refuses to sell licences (the CAD issues them), and fills `shared.police` from the CAD's law departments |
| `modules/bridge/cde/client.lua` | New. The client side of the same: groups, logout, and the police groups |
| `modules/mysql/server.lua` | A `cde` case: player inventories in `cde_characters.inventory` keyed by `citizenid`, trunks and gloveboxes in `cde_vehicles` keyed by `plate` |
| `locales/en.json` | `cde_licence_from_cad`, shown when a shop is asked to sell a licence |
| `README.md` | cde-core in the framework list, and a link to this file |

## Using it

```
setr inventory:framework "cde"
ensure oxmysql
ensure ox_lib
ensure cde-core
ensure ox_inventory
```

cde-core must start before ox_inventory. `inventory:police` is ignored once
cde-core has published the CAD's law departments; until then, and on a server
without CDECAD, the convar applies as usual.
