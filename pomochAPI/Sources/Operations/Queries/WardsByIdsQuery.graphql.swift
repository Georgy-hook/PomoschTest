// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class WardsByIdsQuery: GraphQLQuery {
  public static let operationName: String = "WardsByIdsQuery"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query WardsByIdsQuery($ids: [ID!]!) { wardsByIds(ids: $ids) { __typename id publicInformation { __typename name { __typename fullName } } } }"#
    ))

  public var ids: [ID]

  public init(ids: [ID]) {
    self.ids = ids
  }

  public var __variables: Variables? { ["ids": ids] }

  public struct Data: PomochAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PomochAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("wardsByIds", [WardsById?].self, arguments: ["ids": .variable("ids")]),
    ] }

    /// Список подопечных для указанных идентификаторов
    public var wardsByIds: [WardsById?] { __data["wardsByIds"] }

    /// WardsById
    ///
    /// Parent Type: `Ward`
    public struct WardsById: PomochAPI.SelectionSet {
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

      /// WardsById.PublicInformation
      ///
      /// Parent Type: `WardPublicInformation`
      public struct PublicInformation: PomochAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { PomochAPI.Objects.WardPublicInformation }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("name", Name.self),
        ] }

        /// Имя
        public var name: Name { __data["name"] }

        /// WardsById.PublicInformation.Name
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
}
