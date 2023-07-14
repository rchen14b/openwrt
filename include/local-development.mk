# allow for local directory containing source to be used
# feeds/nss_packages/qca/src/
#
LOCAL_SRC ?= $(TOPDIR)/feeds/nss_packages/qca/src/$(PKG_NAME)

ifeq (exists, $(shell [ -d $(LOCAL_SRC) ] && echo exists))
	PKG_REV=$(shell cd $(LOCAL_SRC)/; git describe --dirty --long --always --abbrev=7| sed 's/.*-g//g')
	PKG_VERSION:=g$(PKG_REV)
	PKG_SOURCE_URL:=
	PKG_UNPACK=mkdir -p $(PKG_BUILD_DIR); $(CP) $(LOCAL_SRC)/* $(PKG_BUILD_DIR)/
endif
