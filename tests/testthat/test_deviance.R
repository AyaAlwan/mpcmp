context("Deviance output")
library(mpcmp)

test_that("Testing attendance example", 
          { 
            data(attendance)
            M.attendance <- glm.cmp(daysabs~ gender+math+prog, data=attendance)
            expect_equal(round(AIC.cmp(M.attendance),3),1739.18)
            expect_equal(round(M.attendance$null.deviance,3), 462.956)
            expect_equal(round(M.attendance$residuals.deviance,3), 383.077)
          })


test_that("Testing takeover example",
          {
            data(takeoverbids)
            M.bids <- glm.cmp(numbids ~ leglrest + rearest + finrest + whtknght 
                              + bidprem + insthold + size + sizesq + regulatn, 
                              data=takeoverbids)
            expect_equal(round(AIC.cmp(M.bids),3),  382.175)
            expect_equal(round(M.bids$null.deviance,2), 182.39)
            expect_equal(round(M.bids$residuals.deviance,1), 131.2)
          })

test_that("Testing cottonbolls example",
          {data(cottonbolls)
            M.bolls <- glm.cmp(nc~ 1+stages:def+stages:def2, data= cottonbolls)
            expect_equal(round(AIC.cmp(M.bolls),3), 440.823)
            expect_equal(round(M.bolls$null.deviance,2), 346.66)
            expect_equal(round(M.bolls$residuals.deviance,1), 125.5)
          })

test_that("Testing fish example",
          { data(fish)
            M.fish <- glm.cmp(species~ 1+log(area), data=fish)
            expect_equal(round(AIC.cmp(M.fish),3),  638.852)
            expect_equal(round(M.fish$null.deviance,2), 101.47)
            expect_equal(round(M.fish$residuals.deviance,1), 59.3)
          })

