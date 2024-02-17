// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetWardsQuery: GraphQLQuery {
  public static let operationName: String = "GetWards"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetWards($first: Int, $after: String) { wards(first: $first, after: $after) { __typename edges { __typename cursor node { __typename id publicInformation { __typename city dateOfBirth dateOfDeath gender photo { __typename url(asAttachment: false) } story name { __typename fullName } } } } pageInfo { __typename endCursor hasNextPage } } }"#
    ))

  public var first: GraphQLNullable<Int>
  public var after: GraphQLNullable<String>

  public init(
    first: GraphQLNullable<Int>,
    after: GraphQLNullable<String>
  ) {
    self.first = first
    self.after = after
  }

  public var __variables: Variables? { [
    "first": first,
    "after": after
  ] }

  public struct Data: PomochAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PomochAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("wards", Wards?.self, arguments: [
        "first": .variable("first"),
        "after": .variable("after")
      ]),
    ] }

    /// Подопечные
    public var wards: Wards? { __data["wards"] }

    /// Wards
    ///
    /// Parent Type: `WardsConnection`
    public struct Wards: PomochAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { PomochAPI.Objects.WardsConnection }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("edges", [Edge]?.self),
        .field("pageInfo", PageInfo.self),
      ] }

      /// A list of edges.
      public var edges: [Edge]? { __data["edges"] }
      /// Information to aid in pagination.
      public var pageInfo: PageInfo { __data["pageInfo"] }

      /// Wards.Edge
      ///
      /// Parent Type: `WardsEdge`
      public struct Edge: PomochAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { PomochAPI.Objects.WardsEdge }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("cursor", String.self),
          .field("node", Node.self),
        ] }

        /// A cursor for use in pagination.
        public var cursor: String { __data["cursor"] }
        /// The item at the end of the edge.
        public var node: Node { __data["node"] }

        /// Wards.Edge.Node
        ///
        /// Parent Type: `Ward`
        public struct Node: PomochAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { PomochAPI.Objects.Ward }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", PomochAPI.ID.self),
            .field("publicInformation", PublicInformation.self),
          ] }

          /// Уникальный идентификатор
          public var id: PomochAPI.ID { __data["id"] }
          /// Общедоступная информация о подопечном
          public var publicInformation: PublicInformation { __data["publicInformation"] }

          /// Wards.Edge.Node.PublicInformation
          ///
          /// Parent Type: `WardPublicInformation`
          public struct PublicInformation: PomochAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { PomochAPI.Objects.WardPublicInformation }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("city", String.self),
              .field("dateOfBirth", PomochAPI.Date.self),
              .field("dateOfDeath", PomochAPI.Date?.self),
              .field("gender", GraphQLEnum<PomochAPI.Gender>.self),
              .field("photo", Photo.self),
              .field("story", String.self),
              .field("name", Name.self),
            ] }

            /// Населённый пункт проживания
            public var city: String { __data["city"] }
            /// Дата рождения
            public var dateOfBirth: PomochAPI.Date { __data["dateOfBirth"] }
            /// Дата смерти
            public var dateOfDeath: PomochAPI.Date? { __data["dateOfDeath"] }
            /// Пол
            public var gender: GraphQLEnum<PomochAPI.Gender> { __data["gender"] }
            /// Фотография подопечного
            public var photo: Photo { __data["photo"] }
            /// История подопечного
            public var story: String { __data["story"] }
            /// Имя
            public var name: Name { __data["name"] }

            /// Wards.Edge.Node.PublicInformation.Photo
            ///
            /// Parent Type: `FileInformation`
            public struct Photo: PomochAPI.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: ApolloAPI.ParentType { PomochAPI.Objects.FileInformation }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("url", String.self, arguments: ["asAttachment": false]),
              ] }

              /// Ссылка для отображения или скачивания файла
              public var url: String { __data["url"] }
            }

            /// Wards.Edge.Node.PublicInformation.Name
            ///
            /// Parent Type: `Nomen`
            public struct Name: PomochAPI.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: ApolloAPI.ParentType { PomochAPI.Objects.Nomen }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("fullName", String.self),
              ] }

              /// Полное имя (Имя Отчество Фамилия)
              public var fullName: String { __data["fullName"] }
            }
          }
        }
      }

      /// Wards.PageInfo
      ///
      /// Parent Type: `PageInfo`
      public struct PageInfo: PomochAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { PomochAPI.Objects.PageInfo }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("endCursor", String?.self),
          .field("hasNextPage", Bool.self),
        ] }

        /// When paginating forwards, the cursor to continue.
        public var endCursor: String? { __data["endCursor"] }
        /// Indicates whether more edges exist following the set defined by the clients arguments.
        public var hasNextPage: Bool { __data["hasNextPage"] }
      }
    }
  }
}
