# State

The [`State`](/guide/states.md) class

## Methods

### `Get`

Gets the current value of the object.

**Returns**

- `any`

---

### `Set`

Sets the current value of the object.

**Parameters**

- **newValue:** `T`\
  The new value to set the state to

**Returns**

- `T`

---

### `Listen`

Listens to changes of state within the object.

**Parameters**

- **listener:** `(new: any) -> ()`\
  The callback to run when changes of state are made

**Returns**

- `() -> ()`

---

### `Destroy`

Destroys the state object.

**Returns**

- `void`
