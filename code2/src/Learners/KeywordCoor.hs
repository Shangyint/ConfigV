{-# LANGUAGE MultiParamTypeClasses, FlexibleInstances #-}

module Learners.KeywordCoor where

import Types.Rules

instance Learnable [] KeywordCoor where
  buildRelations = undefined
  merge = undefined

instance Checkable KeywordCoor where
  check = undefined
