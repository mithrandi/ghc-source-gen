-- Copyright 2019 Google LLC
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

-- | This module provides utilities for rendering GHC syntax as strings.
module GHC.SourceGen.Pretty
    ( showPpr
    , putPpr
    , hPutPpr
    ) where

import DynFlags
import GhcMonad
import Outputable
import System.IO

hPutPpr :: Outputable a => Handle -> a -> Ghc ()
hPutPpr h x = do
    dflags <- getDynFlags
    liftIO $ printForUser dflags h neverQualify $ ppr x

putPpr :: Outputable a => a -> Ghc ()
putPpr = hPutPpr stdout
