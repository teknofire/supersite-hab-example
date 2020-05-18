# This file is the heart of your application's habitat.
# See full docs at https://www.habitat.sh/docs/reference/plan-syntax/

# Required.
# Sets the name of the package. This will be used in along with `pkg_origin`,
# and `pkg_version` to define the fully-qualified package name, which determines
# where the package is installed to on disk, how it is referred to in package
# metadata, and so on.
pkg_name=supersite-db

# Required unless overridden by the `HAB_ORIGIN` environment variable.
# The origin is used to denote a particular upstream of a package.
pkg_origin=will

# Required.
# Sets the version of the package
pkg_version="9.6.11"

# Optional.
# The name and email address of the package maintainer.
pkg_maintainer="Will Fisher <will@teknofire.net>"

# Optional.
# An array of valid software licenses that relate to this package.
# Please choose a license from http://spdx.org/licenses/
pkg_license=("Apache-2.0")

# Optional.
# The scaffolding base for this plan.
# pkg_scaffolding="some/scaffolding"

# Optional.
# A URL that specifies where to download the source from. Any valid wget url
# will work. Typically, the relative path for the URL is partially constructed
# from the pkg_name and pkg_version values; however, this convention is not
# required.
# pkg_source="http://some_source_url/releases/${pkg_name}-${pkg_version}.tar.gz"

# Optional.
# The resulting filename for the download, typically constructed from the
# pkg_name and pkg_version values.
# pkg_filename="${pkg_name}-${pkg_version}.tar.gz"

# Required if a valid URL is provided for pkg_source or unless do_verify() is overridden.
# The value for pkg_shasum is a sha-256 sum of the downloaded pkg_source. If you
# do not have the checksum, you can easily generate it by downloading the source
# and using the sha256sum or gsha256sum tools. Also, if you do not have
# do_verify() overridden, and you do not have the correct sha-256 sum, then the
# expected value will be shown in the build output of your package.
#pkg_shasum="TODO"

# Optional.
# An array of package dependencies needed at runtime. You can refer to packages
# at three levels of specificity: `origin/package`, `origin/package/version`, or
# `origin/package/version/release`.
pkg_deps=(core/postgresql/$pkg_version)

# Optional.
# An array of the package dependencies needed only at build time.
pkg_build_deps=()

pkg_exports=(
  [port]=service.port
  [superuser_name]=superuser.name
)

pkg_exposes=(port)

do_download() {
  return 0
}

do_build() {
  return 0
}

do_install() {
  return 0
}
