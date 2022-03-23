module Main where

import           ConfigV
import qualified GHC.IO.Encoding       as G
import           System.IO
import           System.Exit
import Data.Char

main = do
  G.setLocaleEncoding utf8
  G.setFileSystemEncoding utf8
  G.setForeignEncoding utf8  
 
  executeLearning settings (Right csvThresholds)
  -- expectedResults <- readFile "Datasets/benchmarks/CSVTest/TestCSVLearn_results.json"
  actualResults <- readFile cachedRulesDefaultLoc

  let trim = takeWhile (not. isSpace)
  putStrLn ("Generated unexpected rule set for MMDetection: \n\n"++ (actualResults))

  putStrLn ("Finished whatever")

  -- if (trim expectedResults) == (trim actualResults)
  --   then return ()
  --   else do
  --            putStrLn ("Generated unexpected rule set for CSVTest: \n\n"++ (actualResults))
  --            putStrLn ("expected rule set: \n\n"++ (expectedResults)) >> exitFailure



settings = learnConfig {
        -- learnTarget = "Datasets/benchmarks/CSVTest/"
         learnTarget = "/home/shangyit/projects/DNNSyn/analysis/configcsv_ResNet/"
      , enableOrder = False
      , enableCoarseGrain = True
      , enableFineGrain = True
      , enableSMT = True 
      , verbose = True
      }

csvThresholds = 
 PercentageThresholds {
        intRelSupport_P = 0.95
      , intRelConfidence_P = 1
      , fineGrainSupport_P = 0.95
      , fineGrainConfidence_P = 1
      , smtSupport_P = 0.95
      , smtConfidence_P = 1
      , trivEvidenceThreshold_P = 0
      , orderSupport_P = 0.95
      , orderConfidence_P = 1
      , typeSupport_P = 1
      , typeConfidence_P = 0
      }


