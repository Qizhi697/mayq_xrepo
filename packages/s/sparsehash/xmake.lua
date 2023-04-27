package("sparsehash")
    set_homepage("https://github.com/sparsehash/sparsehash")
    set_description("mayq_sparsehash")
    set_license("BSL")

    add_urls("https://github.com/sparsehash/sparsehash/archive/refs/tags/sparsehash-2.0.4.tar.gz",
             "https://github.com/sparsehash/sparsehash.git")
    -- add_versions("0.10.3", "e9d4facd0c98b12b045de356c6c6c0c06d047d741fe61bde02ca9a68c82d7658")

    on_install("linux", function (package)
        os.vrun("./configure %s --prefix=\"%s\"", package:debug() and "--debug" or "", package:installdir())
        import("package.tools.make").install(package)
    end)