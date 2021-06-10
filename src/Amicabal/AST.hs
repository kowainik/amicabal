module Amicabal.AST
    ( Package (..)
    , Properties (..)
    , SourceRepository (..)
    , Stanza (..)
    , LibraryStanza (..)
    , ExecStanza (..)
    , OtherStanza (..)
    , CommonStanza (..)
    , BuildInfo (..)
    , CabalVersion (..)
    , PVP (..)
    , Visibility (..)
    ) where


data Package = Package
    { packageProperties       :: Properties
    , packageSourceRepository :: Maybe SourceRepository
    , packageLibrary          :: Maybe LibraryStanza
    , packageCommonStanzas    :: [CommonStanza]
    , packageStanzas          :: [Stanza]
    }

data Properties = Properties
    { pCabalVersion  :: CabalVersion
    , pName          :: ByteString
    , pVersion       :: PVP
    , pSynopsis      :: Maybe ByteString
    , pDescribtion   :: Maybe ByteString
    , pHomePage      :: Maybe ByteString
    , pBugReports    :: Maybe ByteString
    , pLicense       :: Maybe ByteString -- TODO: cabal License type
    , pLicenseFile   :: Maybe ByteString
    , pAuthor        :: Maybe ByteString
    , pMaintainer    :: Maybe ByteString
    , pCopyright     :: Maybe ByteString
    , pCategory      :: Maybe ByteString
    , pBuildType     :: Maybe ByteString -- TODO: type
    , pExtraDocFiles :: [ByteString]
    , pExtraSrcFiles :: [ByteString]
    , pTestedWith    :: [ByteString] -- TODO: type
    }

data SourceRepository = SourceRepository
    { srRef      :: ByteString
    , srType     :: ByteString
    , srLocation :: ByteString
    }

data Stanza
    = StanzaNamedLibrary ByteString LibraryStanza
    | StanzaExec ExecStanza
    | StanzaTest OtherStanza
    | StanzaBench OtherStanza

data LibraryStanza = LibraryStanza
    { libraryImport            :: [ByteString]
    , libraryExposedModules    :: [ByteString]
    , libraryReexportedModules :: [ByteString]
    , librarySignatures        :: [ByteString] -- TODO: type
    , libraryExposed           :: Bool
    , libraryVisibility        :: Visibility
    , libraryBuildInfo         :: BuildInfo
    }


data ExecStanza = ExecStanza
    { execName      :: ByteString
    , execMainIs    :: FilePath
    , execScope     :: Visibility
    , execBuildInfo :: BuildInfo
    }

data OtherStanza = OtherStanza
    { otherName      :: ByteString
    , otherType      :: ByteString
    , otherMainIs    :: FilePath
    , otherBuildInfo :: BuildInfo
    }

data CommonStanza = CommonStanza
    { commonName      :: ByteString
    , commonBuildInfo :: BuildInfo
    }

data BuildInfo = BuildInfo
    { buildInfoBuildDepends          :: [ByteString]
    , buildInfoOtherModules          :: [ByteString]
    , buildInfoHsSourceDirs          :: [ByteString]
    , buildInfoDefaultExtensions     :: [ByteString] -- TODO: use cabal extensions type
    , buildInfoDefaultLanguages      :: Maybe ByteString -- TODO: type
    , buildInfoOtherExtensions       :: [ByteString]  -- TODO: cabal type
    , buildInfoBuildTools            :: [ByteString]
    , buildInfoBuildToolDepends      :: [ByteString]
    , buildInfoBuildable             :: Bool
    , buildInfoGhcOptions            :: [ByteString] -- TODO: type
    , buildInfoGhcProfOptions        :: [ByteString]
    , buildInfoGhcSharedOptions      :: [ByteString]
    , buildInfoIncludes              :: [ByteString]
    , buildInfoInstallIncludes       :: [ByteString]
    , buildInfoIncludeDirs           :: [ByteString]
    , buildInfoCSources              :: [ByteString]
    , buildInfoCxxSources            :: [ByteString]
    , buildInfoAsmSources            :: [ByteString]
    , buildInfoCmmSources            :: [ByteString]
    , buildInfoJsSources             :: [ByteString]
    , buildInfoExtraLibraries        :: [ByteString]
    , buildInfoExtraGhciLibraries    :: [ByteString]
    , buildInfoExtraBundledLibraries :: [ByteString]
    , buildInfoExtraLibDirs          :: [ByteString]
    , buildInfoCcOptions             :: [ByteString]
    , buildInfoCppOptions            :: [ByteString]
    , buildInfoCxxOptions            :: [ByteString]
    , buildInfoCmmOptions            :: [ByteString]
    , buildInfoAsmOptions            :: [ByteString]
    , buildInfoLdOptions             :: [ByteString]
    , buildInfoPkgconfigDepends      :: [ByteString]
    , buildInfoFrameworks            :: [ByteString]
    , buildInfoExtraFrameworksDirs   :: [ByteString]
    , buildInfoMixins                :: [ByteString] -- TODO: type
    }

data CabalVersion
    = Cabal_3_4
    | Cabal_3_0
    | Cabal_2_4


data PVP = PVP ByteString

data Visibility
    = Public
    | Private
