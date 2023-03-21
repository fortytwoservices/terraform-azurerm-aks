# Changelog

## [1.3.1](https://github.com/amestofortytwo/terraform-azurerm-aks/compare/v1.3.0...v1.3.1) (2023-03-21)


### Bug Fixes

* **outputs:** wrong var reference ([bbbf729](https://github.com/amestofortytwo/terraform-azurerm-aks/commit/bbbf7290336dc4d7a3cb3881022cceb28d53f5d4))

## [1.3.0](https://github.com/amestofortytwo/terraform-azurerm-aks/compare/v1.2.0...v1.3.0) (2023-03-15)


### Features

* added various exports ([e25f48c](https://github.com/amestofortytwo/terraform-azurerm-aks/commit/e25f48c5b3bc4cdff20a407c03e07176a0908b92)), closes [#13](https://github.com/amestofortytwo/terraform-azurerm-aks/issues/13)
* private cluster variables ([5b95223](https://github.com/amestofortytwo/terraform-azurerm-aks/commit/5b95223535dee36d9ef911abc0a6aaa0c0a12d96)), closes [#10](https://github.com/amestofortytwo/terraform-azurerm-aks/issues/10)

## [1.2.0](https://github.com/amestofortytwo/terraform-azurerm-kubernetes/compare/v1.1.0...v1.2.0) (2022-12-08)


### Features

* aad rbac ([c3097a2](https://github.com/amestofortytwo/terraform-azurerm-kubernetes/commit/c3097a20e9831fd55f408df34f820c4b32fc967b)), closes [#7](https://github.com/amestofortytwo/terraform-azurerm-kubernetes/issues/7)
* added variable for azure policies ([d2f9f14](https://github.com/amestofortytwo/terraform-azurerm-kubernetes/commit/d2f9f1435c55f5b4dba4c248d70ea68e253504de))
* added various optional attributes ([f031c97](https://github.com/amestofortytwo/terraform-azurerm-kubernetes/commit/f031c97b2ce9a93de88125c2bc19e5fa3681ed62)), closes [#8](https://github.com/amestofortytwo/terraform-azurerm-kubernetes/issues/8)
* added workload identity ([aa09aad](https://github.com/amestofortytwo/terraform-azurerm-kubernetes/commit/aa09aadd1fcb57d9fc8c79decba2d9e47170ed63)), closes [#6](https://github.com/amestofortytwo/terraform-azurerm-kubernetes/issues/6)

## [1.1.0](https://github.com/amestofortytwo/terraform-azurerm-kubernetes/compare/v1.0.0...v1.1.0) (2022-11-16)


### Features

* initial node pool implementation ([ea74a57](https://github.com/amestofortytwo/terraform-azurerm-kubernetes/commit/ea74a579e48f7682a218482588b64ca4900dd87d)), closes [#2](https://github.com/amestofortytwo/terraform-azurerm-kubernetes/issues/2)


### Bug Fixes

* removed provider block ([7547a26](https://github.com/amestofortytwo/terraform-azurerm-kubernetes/commit/7547a26a7319cc8a908fe5b42049e2671e1ec790)), closes [#5](https://github.com/amestofortytwo/terraform-azurerm-kubernetes/issues/5)

## 1.0.0 (2022-11-16)


### Features

* add identity and service principal ([ece6854](https://github.com/amestofortytwo/terraform-azurerm-kubernetes/commit/ece68548e19f79390cde360184af00cd002fd7da))
* added standard module input and local variables ([02a80fa](https://github.com/amestofortytwo/terraform-azurerm-kubernetes/commit/02a80fad5fc939c6702547ee289a273d0169e02b))
* initial aks deployment ([d6ca592](https://github.com/amestofortytwo/terraform-azurerm-kubernetes/commit/d6ca592586639931838f0df1d3d7c26f5a4c28b1))
* initial logic for version handling ([e4cfcf3](https://github.com/amestofortytwo/terraform-azurerm-kubernetes/commit/e4cfcf38801bf987bae52ea36539e52d1a9b0feb))
* location variable added ([d11575d](https://github.com/amestofortytwo/terraform-azurerm-kubernetes/commit/d11575d8f77b32770ff454aad22f6a6b24b29033))
* **network:** initial variables added ([a22df7f](https://github.com/amestofortytwo/terraform-azurerm-kubernetes/commit/a22df7fdba8699de6cdfd31e5d1f2c6e7bb1200d))


### Bug Fixes

* added attributes for data source ([1fca53c](https://github.com/amestofortytwo/terraform-azurerm-kubernetes/commit/1fca53c4bdf30665cfa0693b5ee00f5d6008346c))
* fix kubernetes version local ([180aee4](https://github.com/amestofortytwo/terraform-azurerm-kubernetes/commit/180aee4ceef645748df7c22de565940b0fe813ae))
* included org name in module tag ([88060eb](https://github.com/amestofortytwo/terraform-azurerm-kubernetes/commit/88060eb005b49981935f38f5237943d53e257fb3))


### Miscellaneous Chores

* release 1.0.0 ([fad5085](https://github.com/amestofortytwo/terraform-azurerm-kubernetes/commit/fad50857656efc86f136dc28ff2e5f596d632225))
