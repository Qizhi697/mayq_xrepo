package("sparsehash")
    set_homepage("https://github.com/sparsehash/sparsehash")
    set_description("mayq_sparsehash")
    set_license("BSL")

    add_urls("https://github.com/sparsehash/sparsehash/archive/refs/tags/sparsehash-$(version).tar.gz",
             "https://github.com/sparsehash/sparsehash.git")
    add_versions("2.0.4", "8cd1a95827dfd8270927894eb77f62b4087735cbede953884647f16c521c7e58")

    on_install("linux", function (package)
        os.vrun("./configure %s --prefix=\"%s\"", package:debug() and "--debug" or "", package:installdir())
        import("package.tools.make").install(package)
    end)