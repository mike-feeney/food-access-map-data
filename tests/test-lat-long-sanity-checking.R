#Tests for merge-duplicates
library("readr")

test_that("Geocode re-codes rows with coordinates significantly outside of Allegheny County", {
  input <- read_csv("test-data/test_geocode_three_rows_coords_outside_allegheny_input.csv")
  exp_output <- read_csv("test-data/test_geocode_three_rows_exp_output.csv")
  source('../data_prep_scripts/auto_geocode_functions.R')
  output <- run_geocode(input)
  #Test that difference is within acceptable margin of error, currently 0.05
  expect_lte(abs(round(output$longitude, digits=2) - round(exp_output$longitude, digits=2))[1], 0.05)
  expect_lte(abs(round(output$latitude, digits=2) - round(exp_output$latitude, digits=2))[1], 0.05)
})

test_that("Geocode excludes rows that even after geocoding are substantially outside of Allegheny County", {
  input <- read_csv("test-data/test_geocode_three_rows_addr_outside_allegheny_input.csv")
  exp_output <- read_csv("test-data/test_geocode_three_rows_addr_outside_allegheny_exp_output.csv")
  source('../data_prep_scripts/auto_geocode_functions.R')
  output <- run_geocode(input)
  #Test that difference is within acceptable margin of error, currently 0.05
  expect_lte(abs(round(output$longitude, digits=2) - round(exp_output$longitude, digits=2))[1], 0.05)
  expect_lte(abs(round(output$latitude, digits=2) - round(exp_output$latitude, digits=2))[1], 0.05)
})

