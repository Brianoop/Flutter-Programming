# testing_app

Commands for running the tests

# UNIT TEST

flutter test test/models/favorites_test.dart 

# WIDGET TESTING

flutter test test/home_test.dart 

flutter run test/home_test.dart 


# INTEGRATION TESTING

flutter test integration_test/app_test.dart


# PERFORMANCE TESTING

flutter drive \ --driver=test_driver/perf_driver.dart \ --target=integration_test/perf_test.dart \ --profile \ --no-dds
