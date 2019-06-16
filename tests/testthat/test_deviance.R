context("Deviance output")
library(mpcmp)

test_that("Testing attendance example", 
          { 
            data(attendance)
            M.attendance <- glm.cmp(daysabs~ gender+math+prog, data=attendance)
            expect_equal(round(AIC.cmp(M.attendance),3),1739.061)
            expect_equal(round(M.attendance$null.deviance,3), 456.391)
            expect_equal(round(M.attendance$residuals.deviance,3), 377.875)
          })


test_that("Testing takeover example",
          {
            data(takeoverbids)
            M.bids <- glm.cmp(numbids ~ leglrest + rearest + finrest + whtknght 
                              + bidprem + insthold + size + sizesq + regulatn, 
                              data=takeoverbids)
            expect_equal(round(AIC.cmp(M.bids),3),  382.178)
            expect_equal(round(M.bids$null.deviance,2), 181.54)
            expect_equal(round(M.bids$residuals.deviance,1), 130.6)
          })

test_that("Testing cottonbolls example",
          {data(cottonbolls)
            M.bolls <- glm.cmp(nc~ 1+stages:def+stages:def2, data= cottonbolls)
            expect_equal(round(AIC.cmp(M.bolls),3), 440.823)
            expect_equal(round(M.bolls$null.deviance,2), 346.7)
            expect_equal(round(M.bolls$residuals.deviance,1), 125.5)
          })

test_that("Testing fish example",
          { data(fish)
            M.fish <- glm.cmp(species~ 1+log(area), data=fish)
            expect_equal(round(AIC.cmp(M.fish),3),  638.888)
            expect_equal(round(M.fish$null.deviance,2), 102.58)
            expect_equal(round(M.fish$residuals.deviance,1), 60)
          })
