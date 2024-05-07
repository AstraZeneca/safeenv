# As A user
# I Want to create an R environment that raises an error if the name is
# not present
# So That I can protect myself from typos when dereferencing a name

# When I invoke a creation routine
# Then the safe environment is returned
test_that("QSOL-3540", {
  env <- new.safeenv()

  expect_equal(class(env), c("safeenv::safeenv", "environment"))
})

# Given a safe environment
# When I assign a value
# And retrieve it
# Then the value is returned
test_that("QSOL-3541", {
  env <- new.safeenv()
  env$foo <- "hello"
  expect_equal(env$foo, "hello")

  env[["foo"]] <- 5
  expect_equal(env[["foo"]], 5)
  expect_equal(env$foo, 5)
})

# Given a safe environment
# When I assign NULL to a name and
# Then retrieve it Then NULL is returned
test_that("QSOL-3544", {
  env <- new.safeenv()
  env$foo <- "hello"
  expect_equal(env$foo, "hello")
  env$foo <- NULL
  expect_true(is.null(env$foo))

})

# Given a safe environment
# When I use $ to access a member that does not exist
# Then an error is raised
test_that("QSOL-3542", {
  env <- new.safeenv()

  expect_error({
    env$foo
  }, "Name 'foo' not found in environment")
})

# Given a safe environment
# When I use [[]] to access an element that is not present
# Then an error is raised
test_that("QSOL-3543", {
  env <- new.safeenv()

  expect_error({
    env[["foo"]]
  }, "Name 'foo' not found in environment")
})
