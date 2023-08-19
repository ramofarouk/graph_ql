import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQlConfig {
  HttpLink httpLink = HttpLink('http://192.168.43.122:8000/graphql');
  GraphQLClient clientToQuery() =>
      GraphQLClient(link: httpLink, cache: GraphQLCache());
}

class GraphQLService {
  static GraphQlConfig graphQlConfig = GraphQlConfig();
  GraphQLClient graphQLClient = graphQlConfig.clientToQuery();

  Future<QueryResult> performQuery(String query) async {
    print("QUERIIIING");
    QueryOptions options = QueryOptions(document: gql(query));
    QueryResult result = await graphQLClient.query(options);
    if (result.hasException) {
      throw result.exception!;
    }
    return result;
  }
}
