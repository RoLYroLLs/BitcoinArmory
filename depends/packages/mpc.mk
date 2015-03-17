package=mpc
$(package)_version=1.0.3
$(package)_download_path=https://ftp.gnu.org/gnu/$(package)
$(package)_file_name=$(package)-$($(package)_version).tar.gz
$(package)_sha256_hash=617decc6ea09889fb08ede330917a00b16809b8db88c29c31bfbb49cbf88ecc3
$(package)_dependencies=gmp mpfr
$(package)_cc=$(host_CC)
$(package)_cxx=$(host_CXX)
$(package)_ar=$(host_AR)
$(package)_nm=$(host_NM)
$(package)_ranlib=$(host_RANLIB)

define $(package)_config_cmds
  $($(package)_autoconf) --with-gmp=$($(package)_prefix) --with-mpfc=$($(package)_prefix)
endef

define $(package)_build_cmds
  $(MAKE) && \
  $(MAKE) check
endef

define $(package)_stage_cmds
  $(MAKE) DESTDIR=$($(package)_staging_dir) install
endef
