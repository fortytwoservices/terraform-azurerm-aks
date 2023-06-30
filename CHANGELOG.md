# Changelog

## [3.0.0](https://github.com/amestofortytwo/terraform-azurerm-aks/compare/v2.1.0...v3.0.0) (2023-06-30)


### ⚠ BREAKING CHANGES

* local_account_disabled defaults to true, which might cause issues for existing clusters

### Features

* add auto scaler profile ([7159113](https://github.com/amestofortytwo/terraform-azurerm-aks/commit/7159113aeb5f6336950aa9f96ea54be8d405699a))
* add storage profile ([14930e9](https://github.com/amestofortytwo/terraform-azurerm-aks/commit/14930e98d415aefb6e880b602e121a7034350168))
* add support for defender and azure monitor enabling ([53b558e](https://github.com/amestofortytwo/terraform-azurerm-aks/commit/53b558e002eae443e0addb472257602e865672ad))
* Add support for local_account_disabled ([e61064c](https://github.com/amestofortytwo/terraform-azurerm-aks/commit/e61064cac992c965cec24dd98ddb4564bab07e5a))
* add the option to specify sku_tier ([38f130d](https://github.com/amestofortytwo/terraform-azurerm-aks/commit/38f130d27e7841fe3b7259b550fead16db3b6338))
* Adds new output aks_id ([0012e83](https://github.com/amestofortytwo/terraform-azurerm-aks/commit/0012e83dd5062619593d90a1d40bb6327ffad8c9))
* set azure monitor to default true ([d0b1799](https://github.com/amestofortytwo/terraform-azurerm-aks/commit/d0b179907ec92a4456615349c52b5c77d9662402))
* tag should be optional ([54989dd](https://github.com/amestofortytwo/terraform-azurerm-aks/commit/54989dd98ac60806e2806ac649851f3d22635141))


### Bug Fixes

* fix issue with validation of storage_profile ([7f86a8e](https://github.com/amestofortytwo/terraform-azurerm-aks/commit/7f86a8eb0b75318be68881f39542c69f934a9379))
* validation fails if other storage_profile options than disk_driver_version is set ([8a0c927](https://github.com/amestofortytwo/terraform-azurerm-aks/commit/8a0c927a8133006f66cbaf8bfa388ca695bdec12))

## [2.1.0](https://github.com/amestofortytwo/terraform-azurerm-aks/compare/v2.0.0...v2.1.0) (2023-04-11)


### Features

* **network:** added cilium related attributes ([4d32f1d](https://github.com/amestofortytwo/terraform-azurerm-aks/commit/4d32f1d4818522dee03a5f8bfccf271016e17446)), closes [#28](https://github.com/amestofortytwo/terraform-azurerm-aks/issues/28)


### Bug Fixes

* **network:** pod sub id on additional pools ([d8595ee](https://github.com/amestofortytwo/terraform-azurerm-aks/commit/d8595ee561ec3a0a43213a9e668741df08a10323))
* node counts defaults ([ca90e23](https://github.com/amestofortytwo/terraform-azurerm-aks/commit/ca90e234b70ff3d51d4a41bd9966e218844a24fa))

## [2.0.0](https://github.com/amestofortytwo/terraform-azurerm-aks/compare/v1.3.1...v2.0.0) (2023-03-29)


### ⚠ BREAKING CHANGES

* **aks:** remove append aks name

### Bug Fixes

* **aks:** remove append aks name ([01ff382](https://github.com/amestofortytwo/terraform-azurerm-aks/commit/01ff382fd8796396d6db019329cb31e1ce436598))

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
