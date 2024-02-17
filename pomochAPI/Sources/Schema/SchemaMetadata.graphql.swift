// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public typealias ID = String

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == PomochAPI.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == PomochAPI.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == PomochAPI.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == PomochAPI.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
    switch typename {
    case "Query": return PomochAPI.Objects.Query
    case "WardsConnection": return PomochAPI.Objects.WardsConnection
    case "WardsEdge": return PomochAPI.Objects.WardsEdge
    case "Ward": return PomochAPI.Objects.Ward
    case "WardPublicInformation": return PomochAPI.Objects.WardPublicInformation
    case "FileInformation": return PomochAPI.Objects.FileInformation
    case "FileUploadInformation": return PomochAPI.Objects.FileUploadInformation
    case "Nomen": return PomochAPI.Objects.Nomen
    case "PageInfo": return PomochAPI.Objects.PageInfo
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
