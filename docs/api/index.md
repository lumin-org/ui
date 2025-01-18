# UI

The main class

## Functions

### `New`

Creates a new instance with the provided properties.

**Parameters**

- **class:** `string`\
  The class name of the instance to be created

- **props:** `{ any }`\
  Properties to be applied to the instance

**Returns**

- `Instance`

---

### `Update`

Updates an instance, writing to its properties.

**Parameters**

- **instance:** `Instance`\
  The instance that should be updated

- **props:** `{ any }`\
  Properties to be applied to the instance

**Returns**

- `Instance`

---

### `State`

**Parameters**

- **initial:** `any`\
  The initial value that the state is assigned to

**Returns**

- [`State`](state.md)

---

### `Compute`

**Parameters**

- **processor:** `() -> ()`\
  The processor function to run when dependencies are changed

- **dependencies:** [`{ State }`](state.md)\
  The dependencies that computed state relies on

**Returns**

- [`Compute`](compute.md)

---

### `Spring`

**Parameters**

- **goal:** [`State`](state.md)\
  The goal point that the spring should move towards, should be animatable

- **damping:** `number` <Badge type="warning" text="OPTIONAL" />\
  The damping of the spring
  
- **speed:** `number` <Badge type="warning" text="OPTIONAL" />\
  The speed of the spring

**Returns**

- [`Spring`](spring.md)

---

### `Cleanup`

Cleans up the provided items as soon as the parent instance is destroyed.

**Parameters**

- **clean:** `{ Instance } | Instance`\
  The action to create, this is what is returned

**Returns**

- `(instance: Instance) -> ()`

---

### `Action`

Creates a new action, which allows for custom modifications to instances.

**Parameters**

- **apply:** `(...any) -> ()`\
  The action to create, this is what is returned

**Returns**

- `(...any) -> ()`

---

### `Event`

Connects a callback to an event on the instance.

**Parameters**

- **event:** `string`\
  The event that should be connected to

- **callback:** `(...any) -> ()`\
  The callback to run when the provided event is fired

- **scope:** `{ any }?` <Badge type="warning" text="OPTIONAL" />\
  A table that the connection is inserted into

**Returns**

- `(instance: Instance) -> ()`

---

### `Changed`

Allows you to observe changes of properties within an object, and supplies the value of
the changed property as a callback argument.

**Parameters**

- **prop:** `string`\
  The property that have its changes listened to

- **callback:** `(changed: any) -> ()`\
  The callback to run when the provided property is changed

- **scope:** `{ any }?` <Badge type="warning" text="OPTIONAL" />\
  A table that the connection is inserted into

**Returns**

- `(instance: Instance) -> ()`

---

### `Tags`

Adds a tag (or multiple) with the provided name to the instance.

**Parameters**

- **names:** `string`\
  A list of tags to be applied to the instance

**Returns**

- `(instance: Instance) -> ()`


