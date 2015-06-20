QUnit.module 'ES6 Reflect.preventExtensions'

{defineProperty, isExtensible} = Object

MODERN = (-> try 2 == defineProperty({}, \a, get: -> 2)a)!

eq = strictEqual

test '*' !->
  {preventExtensions} = Reflect
  ok typeof! preventExtensions is \Function, 'Reflect.preventExtensions is function'
  eq preventExtensions.length, 1, 'arity is 1'
  ok /native code/.test(preventExtensions), 'looks like native'
  if \name of preventExtensions => eq preventExtensions.name, \preventExtensions, 'name is "preventExtensions"'
  obj = {}
  ok preventExtensions(obj), on
  if MODERN
    ok !isExtensible obj
  throws (-> preventExtensions 42), TypeError, 'throws on primitive'