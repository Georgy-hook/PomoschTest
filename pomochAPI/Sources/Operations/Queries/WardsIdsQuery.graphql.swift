// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class WardsIdsQuery: GraphQLQuery {
  public static let operationName: String = "WardsIds"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query WardsIds { wardsIds }"#
    ))

  public init() {}

  public struct Data: PomochAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PomochAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("wardsIds", [PomochAPI.ID].self),
    ] }

    /// Идентификаторы всех подопечных
    public var wardsIds: [PomochAPI.ID] { __data["wardsIds"] }
  }
}
