# Plasma [![CI status][ci-badge]][ci] [![Docs status][docs-badge]][docs]

**Plasma** is a declarative, immediate mode UI widget library for _[Roblox]_.

⚠️ Plasma is not quite ready for production yet. There might be bugs and missing
features!

[ci-badge]: https://github.com/matter-ecs/plasma/actions/workflows/ci.yaml/badge.svg
[docs-badge]: https://github.com/matter-ecs/plasma/actions/workflows/docs.yaml/badge.svg
[ci]: https://github.com/matter-ecs/plasma/actions/workflows/ci.yaml
[docs]: https://matter-ecs.github.io/plasma/
[roblox]: https://www.roblox.com/

## Installation

Plasma can be installed with [Wally] by including it as a dependency in your
`wally.toml` file.

```toml
Plasma = "matter-ecs/plasma@0.4.4"
```

## Migration

If you're currently using the scope `evaera/plasma`, prior versions are the same
package. You can migrate by changing your `wally.toml` file to use the scope
`matter-ecs/plasma`.

## Building

Before building, you'll need to install all dependencies using [Wally].

You can then sync or build the project with [Rojo]. Plasma contains several
project files with different builds of the project. The `default.project.json`
is the package build.

[rojo]: https://rojo.space/
[wally]: https://wally.run/

## Contributing

Contributions are welcome, please make a pull request! Check out our
[contribution] guide for further information.

Please read our [code of conduct] when getting involved.

[contribution]: CONTRIBUTING.md
[code of conduct]: CODE_OF_CONDUCT.md

## Project Legacy

Plasma was originally pioneered by [@evaera](https://www.github.com/evaera). She
laid the robust foundation for the work we continue today.

## License

Plasma is free software available under the MIT license. See the [license] for
details.

[license]: LICENSE.md
