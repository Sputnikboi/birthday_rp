# Third-party assets

## Fancy Balloons — balloon model and textures

The balloon body geometry (`assets/birthday/models/item/balloon.json`) and the six
balloon textures (`assets/birthday/textures/item/balloon_{red,blue,yellow,pink,purple,green}.png`)
are derived from **Fancy Balloons** by TisKodie.

- Source: https://github.com/kodiitulip/fancy-balloons
- Licence: MIT
- Copyright 2024 TisKodie

Changes made: kept the balloon body element and its UV mapping, dropped the
rideable platform and its two struts, added a knot and a hanging string, removed
the `texture_size` field (unsupported in MC 26.1.2), and re-pointed the texture
references into the `birthday` namespace.

```
MIT License

Copyright 2024 TisKodie

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in the
Software without restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the
Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```

## Earth2Java — moobloom

The moobloom textures (`moobloom_cow.png`, `buttercup.png`) come from
**Earth2Java** by Slexom, which ports Minecraft Earth mobs to Java Edition.

- Source: https://github.com/Slexom/earth2java
- Licence: MIT

## Authored for this pack

`party_hat.json` + `party_hat.png`, `yippee.json` + `yippee_body.png`, and the
knot/string elements of the balloon are original to this pack.
