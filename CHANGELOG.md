# Changelog

## [5.6.0](https://github.com/fortytwoservices/terraform-azurerm-aks/compare/v5.5.0...v5.6.0) (2025-10-27)


### Features

* add vnet integration support ([#388](https://github.com/fortytwoservices/terraform-azurerm-aks/issues/388)) ([b7497c3](https://github.com/fortytwoservices/terraform-azurerm-aks/commit/b7497c3115bfa40f0e6eef39c79c11148450f8a7))


### Bug Fixes

* correct bug with advanced_networking ([#386](https://github.com/fortytwoservices/terraform-azurerm-aks/issues/386)) ([f2292f1](https://github.com/fortytwoservices/terraform-azurerm-aks/commit/f2292f11ad9167765a3856f8abd166718572895f))

## [5.5.0](https://github.com/fortytwoservices/terraform-azurerm-aks/compare/v5.4.1...v5.5.0) (2025-10-27)


### Features

* add support for advanced networking ([#383](https://github.com/fortytwoservices/terraform-azurerm-aks/issues/383)) ([c1b179a](https://github.com/fortytwoservices/terraform-azurerm-aks/commit/c1b179a859e77dc786995c8c115bcaaeba894532))
* remove transparent_huge_page_enabled and add transparent_huge_page ([#385](https://github.com/fortytwoservices/terraform-azurerm-aks/issues/385)) ([2ee2cb0](https://github.com/fortytwoservices/terraform-azurerm-aks/commit/2ee2cb0e810c229957987317a5baa20ced92740a))

## [5.4.1](https://github.com/fortytwoservices/terraform-azurerm-aks/compare/v5.4.0...v5.4.1) (2025-10-24)


### Bug Fixes

* correct issue with maintenance windows ([#379](https://github.com/fortytwoservices/terraform-azurerm-aks/issues/379)) ([c2c5da9](https://github.com/fortytwoservices/terraform-azurerm-aks/commit/c2c5da9e5ca0b7016964777a78c458a3cfe817a9))

## [5.4.0](https://github.com/fortytwoservices/terraform-azurerm-aks/compare/v5.3.2...v5.4.0) (2025-10-21)


### Features

* add node_resource_group_id as output ([#376](https://github.com/fortytwoservices/terraform-azurerm-aks/issues/376)) ([ea6e848](https://github.com/fortytwoservices/terraform-azurerm-aks/commit/ea6e84894386588870cb2751ea2ad5620b20d2ce))

## [5.3.2](https://github.com/fortytwoservices/terraform-azurerm-aks/compare/v5.3.1...v5.3.2) (2025-09-25)


### Bug Fixes

* correct metric lookup ([#366](https://github.com/fortytwoservices/terraform-azurerm-aks/issues/366)) ([d8891be](https://github.com/fortytwoservices/terraform-azurerm-aks/commit/d8891be515cce3d8869d8b6cca436aba023f15ac))

## [5.3.1](https://github.com/fortytwoservices/terraform-azurerm-aks/compare/v5.3.0...v5.3.1) (2025-09-16)


### Bug Fixes

* correct placement of monitor_metrics ([#363](https://github.com/fortytwoservices/terraform-azurerm-aks/issues/363)) ([48f4565](https://github.com/fortytwoservices/terraform-azurerm-aks/commit/48f45659f5e6b029cddb95d217e2dcf3a0908c6a))

## [5.3.0](https://github.com/fortytwoservices/terraform-azurerm-aks/compare/v5.2.0...v5.3.0) (2025-09-16)


### Features

* add monitor_metrics parameter ([#361](https://github.com/fortytwoservices/terraform-azurerm-aks/issues/361)) ([f3c39d6](https://github.com/fortytwoservices/terraform-azurerm-aks/commit/f3c39d628657eb4a3782575a90b2918b07bcf3e8))

## [5.2.0](https://github.com/fortytwoservices/terraform-azurerm-aks/compare/v5.1.0...v5.2.0) (2025-05-14)


### Features

* support native k8s garbage collection in additional nodepools ([426300f](https://github.com/fortytwoservices/terraform-azurerm-aks/commit/426300f7326f2ceeb5da314815450fe051334d4b))
* support native k8s garbage collection in additional nodepools ([e67ddba](https://github.com/fortytwoservices/terraform-azurerm-aks/commit/e67ddba61a12e60c6d24da63049236a5c2cb6118))
* update placement of block + readme ([4c40b11](https://github.com/fortytwoservices/terraform-azurerm-aks/commit/4c40b11966f8cc1c457aefd4de6cc0d308df8de6))

## [5.1.0](https://github.com/fortytwoservices/terraform-azurerm-aks/compare/v5.0.2...v5.1.0) (2025-04-22)


### Features

* add upgrade_override parameter and update upgrade_settings ([#321](https://github.com/fortytwoservices/terraform-azurerm-aks/issues/321)) ([3784704](https://github.com/fortytwoservices/terraform-azurerm-aks/commit/378470480fd542a70a55b27ac75943a13205ea4e))

## [5.0.2](https://github.com/fortytwoservices/terraform-azurerm-aks/compare/v5.0.1...v5.0.2) (2024-11-05)


### Bug Fixes

* add support for none for network_policy ([#305](https://github.com/fortytwoservices/terraform-azurerm-aks/issues/305)) ([37b7d0d](https://github.com/fortytwoservices/terraform-azurerm-aks/commit/37b7d0d41f520e2a3b522f352df8042389ebc7f2))

## [5.0.1](https://github.com/fortytwoservices/terraform-azurerm-aks/compare/v5.0.0...v5.0.1) (2024-11-01)


### Bug Fixes

* correct failed validation logic for network profile ([#303](https://github.com/fortytwoservices/terraform-azurerm-aks/issues/303)) ([4ecef4f](https://github.com/fortytwoservices/terraform-azurerm-aks/commit/4ecef4f14696118786c0e42931acffaab7a51750))

## [5.0.0](https://github.com/fortytwoservices/terraform-azurerm-aks/compare/v4.2.0...v5.0.0) (2024-10-30)


### ⚠ BREAKING CHANGES

* set cilium as default network_policy ([#294](https://github.com/fortytwoservices/terraform-azurerm-aks/issues/294))

### Features

* added sysctl_config ([#298](https://github.com/fortytwoservices/terraform-azurerm-aks/issues/298)) ([d27328b](https://github.com/fortytwoservices/terraform-azurerm-aks/commit/d27328b57438a474058252cef4be847765021f54))
* allow changing sku and retention of default log workspace ([#301](https://github.com/fortytwoservices/terraform-azurerm-aks/issues/301)) ([11e4c73](https://github.com/fortytwoservices/terraform-azurerm-aks/commit/11e4c73a7b0fce0f0a9fa3636a8e2811596c63d7))
* set cilium as default network_policy ([#294](https://github.com/fortytwoservices/terraform-azurerm-aks/issues/294)) ([6992767](https://github.com/fortytwoservices/terraform-azurerm-aks/commit/6992767233f1f19841167f180a910a7a83de8644))
* update automation workflow ([#300](https://github.com/fortytwoservices/terraform-azurerm-aks/issues/300)) ([d8c224b](https://github.com/fortytwoservices/terraform-azurerm-aks/commit/d8c224b49daa1ebb400a606bb158c9f5a967b7a1))

## [4.2.0](https://github.com/fortytwoservices/terraform-azurerm-aks/compare/v4.1.0...v4.2.0) (2024-10-21)


### Features

* add support for host_encryption_enabled i additional nodepool ([#291](https://github.com/fortytwoservices/terraform-azurerm-aks/issues/291)) ([69492f6](https://github.com/fortytwoservices/terraform-azurerm-aks/commit/69492f6a2295024f327665295831901217f49cee))
* add support for workload_autoscaler_profile ([#293](https://github.com/fortytwoservices/terraform-azurerm-aks/issues/293)) ([92ec804](https://github.com/fortytwoservices/terraform-azurerm-aks/commit/92ec8044df9ce159134cad98a7bafd4bea26159e))

## [4.1.0](https://github.com/fortytwoservices/terraform-azurerm-aks/compare/v4.0.0...v4.1.0) (2024-09-18)


### Features

* added support for temporary_name_for_rotation ([#268](https://github.com/fortytwoservices/terraform-azurerm-aks/issues/268)) ([a3461cf](https://github.com/fortytwoservices/terraform-azurerm-aks/commit/a3461cf4a3992a1e9e764a2715b848b48fc0bf20))

## [4.0.0](https://github.com/fortytwoservices/terraform-azurerm-aks/compare/v3.9.0...v4.0.0) (2024-09-14)


### ⚠ BREAKING CHANGES

* bump azurerm version requirement to v4 ([#261](https://github.com/fortytwoservices/terraform-azurerm-aks/issues/261))

### Features

* bump azurerm version requirement to v4 ([#261](https://github.com/fortytwoservices/terraform-azurerm-aks/issues/261)) ([2a6fd98](https://github.com/fortytwoservices/terraform-azurerm-aks/commit/2a6fd983dadd9433e022d679319355afd567c29d))
* update params and variables to azurerm v4 ([#262](https://github.com/fortytwoservices/terraform-azurerm-aks/issues/262)) ([bf0cd27](https://github.com/fortytwoservices/terraform-azurerm-aks/commit/bf0cd279d835c141ad43a7aac616a61bdc91f2d9))


### Bug Fixes

* add back renamed variable network_data_plane ([#265](https://github.com/fortytwoservices/terraform-azurerm-aks/issues/265)) ([176a6f7](https://github.com/fortytwoservices/terraform-azurerm-aks/commit/176a6f776cf9f61d543fb4fe805e033193fb75a0))
* change check of value from managed to azure_rbac_enabled ([#264](https://github.com/fortytwoservices/terraform-azurerm-aks/issues/264)) ([e0f8614](https://github.com/fortytwoservices/terraform-azurerm-aks/commit/e0f86147a623b68952db9e53598d12487004bfa7))
* set azure_rbac_enabled default true ([#266](https://github.com/fortytwoservices/terraform-azurerm-aks/issues/266)) ([64c52fa](https://github.com/fortytwoservices/terraform-azurerm-aks/commit/64c52fae7fb2acaf166ccf9b7a3868a5258f81c7))

## [3.9.0](https://github.com/fortytwoservices/terraform-azurerm-aks/compare/v3.8.0...v3.9.0) (2024-09-11)


### Features

* added support for specifying kubelet identity ([#257](https://github.com/fortytwoservices/terraform-azurerm-aks/issues/257)) ([4584874](https://github.com/fortytwoservices/terraform-azurerm-aks/commit/45848745e34f267a1a51f36c681da4d6f8a7eaa7))

## [3.8.0](https://github.com/fortytwoservices/terraform-azurerm-aks/compare/v3.7.2...v3.8.0) (2024-08-13)


### Features

* support msi_auth_for_monitoring_enabled in oms_agent ([#243](https://github.com/fortytwoservices/terraform-azurerm-aks/issues/243)) ([803782f](https://github.com/fortytwoservices/terraform-azurerm-aks/commit/803782f54ad39748c92dd1cc99c4c6918918820f))


### Bug Fixes

* correct defender ignore changes ([#240](https://github.com/fortytwoservices/terraform-azurerm-aks/issues/240)) ([4b153ca](https://github.com/fortytwoservices/terraform-azurerm-aks/commit/4b153ca39c27e991cc1fcaaa9381f8d130a915a1))

## [3.7.2](https://github.com/fortytwoservices/terraform-azurerm-aks/compare/v3.7.1...v3.7.2) (2024-08-09)


### Bug Fixes

* correct ignore on defender changes ([#238](https://github.com/fortytwoservices/terraform-azurerm-aks/issues/238)) ([21f12a9](https://github.com/fortytwoservices/terraform-azurerm-aks/commit/21f12a957a7978b48dbdca0723995eebd4dbc1bd))

## [3.7.1](https://github.com/fortytwoservices/terraform-azurerm-aks/compare/v3.7.0...v3.7.1) (2024-08-09)


### Bug Fixes

* correct ignore_changes on defender law ([#237](https://github.com/fortytwoservices/terraform-azurerm-aks/issues/237)) ([c239900](https://github.com/fortytwoservices/terraform-azurerm-aks/commit/c239900f36f1bef128e56c6838b75d5ef7209846))
* issue with node_os_channel_upgrade condition ([#235](https://github.com/fortytwoservices/terraform-azurerm-aks/issues/235)) ([8df5363](https://github.com/fortytwoservices/terraform-azurerm-aks/commit/8df5363dc8bbdb78f8a4fd474b95ffa0d7e3347d))

## [3.7.0](https://github.com/fortytwoservices/terraform-azurerm-aks/compare/v3.6.0...v3.7.0) (2024-08-09)


### Features

* add support for api_server_access_profile ([3e5f3b9](https://github.com/fortytwoservices/terraform-azurerm-aks/commit/3e5f3b9bc1d39f7b62495be50803dbea32fb5949))
* add variable for ignore_changes on aks resource ([#232](https://github.com/fortytwoservices/terraform-azurerm-aks/issues/232)) ([f4fc69f](https://github.com/fortytwoservices/terraform-azurerm-aks/commit/f4fc69f9b2fd5a734e93b955a524070d32e81ded))
* use existing api_server_access_profile block and add new parameters ([b29f4fa](https://github.com/fortytwoservices/terraform-azurerm-aks/commit/b29f4fa8d9a4ca5ed25736048a78ef7f990a64b2))

## [3.6.0](https://github.com/fortytwoservices/terraform-azurerm-aks/compare/v3.5.0...v3.6.0) (2024-07-29)


### Features

* add support for node_os_channel_upgrade and maintenance windows ([#202](https://github.com/fortytwoservices/terraform-azurerm-aks/issues/202)) ([f0ca6fe](https://github.com/fortytwoservices/terraform-azurerm-aks/commit/f0ca6fe37432c703b3a89b045c3645273f973438))
* update build files ([#194](https://github.com/fortytwoservices/terraform-azurerm-aks/issues/194)) ([521201b](https://github.com/fortytwoservices/terraform-azurerm-aks/commit/521201bb20ee8523a91482a2aef347fef70c2e9f))


### Bug Fixes

* grept apply ([#196](https://github.com/fortytwoservices/terraform-azurerm-aks/issues/196)) ([36906a8](https://github.com/fortytwoservices/terraform-azurerm-aks/commit/36906a83963bf199b7c76f5ef1c8c557efd543d8))
* grept apply ([#197](https://github.com/fortytwoservices/terraform-azurerm-aks/issues/197)) ([6c132ae](https://github.com/fortytwoservices/terraform-azurerm-aks/commit/6c132ae97dc151f97b674e8e5753361cd23b6012))
* grept apply ([#198](https://github.com/fortytwoservices/terraform-azurerm-aks/issues/198)) ([a846e09](https://github.com/fortytwoservices/terraform-azurerm-aks/commit/a846e09b7054564944f49e59d3e3cbbc0dfd0212))
* grept apply ([#200](https://github.com/fortytwoservices/terraform-azurerm-aks/issues/200)) ([92b359a](https://github.com/fortytwoservices/terraform-azurerm-aks/commit/92b359a7bfa1742fd302d5d1abb2cfaf6ecd414a))
* grept apply ([#207](https://github.com/fortytwoservices/terraform-azurerm-aks/issues/207)) ([1f2292e](https://github.com/fortytwoservices/terraform-azurerm-aks/commit/1f2292e410022490b7f4a4cbf1b7307c50689e8e))
* grept apply ([#208](https://github.com/fortytwoservices/terraform-azurerm-aks/issues/208)) ([a9b47e6](https://github.com/fortytwoservices/terraform-azurerm-aks/commit/a9b47e63276e998a6a78f747432051e6063f91e6))

## [3.5.0](https://github.com/fortytwoservices/terraform-azurerm-aks/compare/v3.4.1...v3.5.0) (2024-06-13)


### Features

* add support for image_cleaner ([#191](https://github.com/fortytwoservices/terraform-azurerm-aks/issues/191)) ([403ba01](https://github.com/fortytwoservices/terraform-azurerm-aks/commit/403ba01d7f84a3988439e2975673dde234419df2))
* add upgrade_settings on additional node pool ([#189](https://github.com/fortytwoservices/terraform-azurerm-aks/issues/189)) ([587ef67](https://github.com/fortytwoservices/terraform-azurerm-aks/commit/587ef6707939c457313d2d7bfb4f68e81486bb19))

## [3.4.1](https://github.com/amestofortytwo/terraform-azurerm-aks/compare/v3.4.0...v3.4.1) (2024-04-17)


### Bug Fixes

* correct automatic_channel_upgrade default value ([20683c4](https://github.com/amestofortytwo/terraform-azurerm-aks/commit/20683c4446f1bb094fc0849b4bf937a8921b2a84))
* update type of max_surge to string ([1590b4b](https://github.com/amestofortytwo/terraform-azurerm-aks/commit/1590b4b6cea1a1ecbc675909da0ce641dee9072f))

## [3.4.0](https://github.com/amestofortytwo/terraform-azurerm-aks/compare/v3.3.1...v3.4.0) (2024-04-04)


### Features

* add new block api_server_access_profile ([0ba27a8](https://github.com/amestofortytwo/terraform-azurerm-aks/commit/0ba27a87a1f24a9d40639f7931d65147416c642d))
* add upgrade_settings ([8f1de9c](https://github.com/amestofortytwo/terraform-azurerm-aks/commit/8f1de9c1eb89a4cb3d293417d09a95ee778001db))


### Bug Fixes

* correct linting ([bcfa3ec](https://github.com/amestofortytwo/terraform-azurerm-aks/commit/bcfa3ec37cf41ea1c6139458a3d3f985cd5e4914))
* linting ([b1bf4df](https://github.com/amestofortytwo/terraform-azurerm-aks/commit/b1bf4dfb6e11945293ca911dba4750990d7196ee))
* update linting and docs ([0fbf041](https://github.com/amestofortytwo/terraform-azurerm-aks/commit/0fbf0419b4a0fd676569261e9f2934923d5d237c))

## [3.3.1](https://github.com/amestofortytwo/terraform-azurerm-aks/compare/v3.3.0...v3.3.1) (2024-03-08)


### Bug Fixes

* correct permissions ([2972b81](https://github.com/amestofortytwo/terraform-azurerm-aks/commit/2972b813e3b01926159936b4d4699632508f6c4f))
* Merge pull request [#141](https://github.com/amestofortytwo/terraform-azurerm-aks/issues/141) from amestofortytwo/fix/fix-kube-config-outputs ([600b099](https://github.com/amestofortytwo/terraform-azurerm-aks/commit/600b099d45426a24e29ad2d905edf2d53f877f29))
* try to correct ([e6c212a](https://github.com/amestofortytwo/terraform-azurerm-aks/commit/e6c212a47c8035c6dfe03aee6f29d8b348ecdc43))
* updated output for host and client_ca_certificate to not check if local account is disabled, and to output from kube_config and not kube_admin_config ([600b099](https://github.com/amestofortytwo/terraform-azurerm-aks/commit/600b099d45426a24e29ad2d905edf2d53f877f29))
* updated output for host and client_ca_certificate to not check if local account is disabled, and to output from kube_config and not kube_admin_config ([040c26b](https://github.com/amestofortytwo/terraform-azurerm-aks/commit/040c26bb4b900956038e4bdb0579d35bd386405e))

## [3.3.0](https://github.com/amestofortytwo/terraform-azurerm-aks/compare/v3.2.0...v3.3.0) (2023-12-27)


### Features

* add private_dns_zone_id ([3b8d25d](https://github.com/amestofortytwo/terraform-azurerm-aks/commit/3b8d25db1c8d92280e44aadbd0ad3293d2c79b0f))
* add run_command_enabled variable ([3354b4e](https://github.com/amestofortytwo/terraform-azurerm-aks/commit/3354b4e4003a2a296cd78feac4d6a1b309a9c062))


### Bug Fixes

* correct none for automatic_channel_upgrade ([eb8e3e3](https://github.com/amestofortytwo/terraform-azurerm-aks/commit/eb8e3e37d9f675756861c6f18757c88c779784ce))

## [3.2.0](https://github.com/amestofortytwo/terraform-azurerm-aks/compare/v3.1.0...v3.2.0) (2023-12-12)


### Features

* added input parameter for availability zones in default node pool ([3f5711b](https://github.com/amestofortytwo/terraform-azurerm-aks/commit/3f5711b186dd7643c537b27f6a86362e6dd9950d))
* changed input to string instead of number ([d81796c](https://github.com/amestofortytwo/terraform-azurerm-aks/commit/d81796c367e4acc68d77c64a71d17ee9bb83bed6))

## [3.1.0](https://github.com/amestofortytwo/terraform-azurerm-aks/compare/v3.0.0...v3.1.0) (2023-09-29)


### Features

* add output for managed identity block ([8185de7](https://github.com/amestofortytwo/terraform-azurerm-aks/commit/8185de705064ba7bd60b09c50d1e232267b16c33))
* add support for auto scaling of default node pool ([4b34c76](https://github.com/amestofortytwo/terraform-azurerm-aks/commit/4b34c765b7030579006eac88bc83d1f96942940a))
* add support for automatic_channel_upgrade ([1b6e3ef](https://github.com/amestofortytwo/terraform-azurerm-aks/commit/1b6e3efe6c0fe629470425af5c1fc17da4c90f16))
* add support for des and encryption-at-rest with cmk ([d2802f7](https://github.com/amestofortytwo/terraform-azurerm-aks/commit/d2802f7124b6464ed4ca0a8394e4a9690eb9ae6b))
* add support for enabling key vault secrets provider ([a3240b5](https://github.com/amestofortytwo/terraform-azurerm-aks/commit/a3240b56675be5565c0521ab3d5c497c9af0a996))
* add support for os config on additional node pool ([73b4aa3](https://github.com/amestofortytwo/terraform-azurerm-aks/commit/73b4aa3f60833d6fb8fff011d4fa7e81ad6cf18a))
* add support for os_sku on additnl node pool ([c0220c7](https://github.com/amestofortytwo/terraform-azurerm-aks/commit/c0220c76975c4fc4324d51bec6d4dee8a9ddb1b3))
* add support for spot nodes on additional node pool ([d9962d1](https://github.com/amestofortytwo/terraform-azurerm-aks/commit/d9962d1e23456dfe353106b564f43de876a9eebc))
* output oidc issuer url ([cd0fc63](https://github.com/amestofortytwo/terraform-azurerm-aks/commit/cd0fc6370d458634e38ff492f60d28d1018635d0))
* support etcd encryption-at-rest ([86bd7c5](https://github.com/amestofortytwo/terraform-azurerm-aks/commit/86bd7c507b436b78a4113ebdcb4de0d36407c5d0))


### Bug Fixes

* add default tags to law ([43b1662](https://github.com/amestofortytwo/terraform-azurerm-aks/commit/43b16624b6f79b2f90c755d7189b1c208587f1c6))

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
