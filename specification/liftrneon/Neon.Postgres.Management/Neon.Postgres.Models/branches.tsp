import "./commons.tsp"; // Import common types

using TypeSpec.Http;
using TypeSpec.Rest;
using Azure.ResourceManager;
using TypeSpec.Versioning;
using LiftrBase.Data;

namespace Neon.Postgres.Models;

@doc("The Branch resource type.")
@added(Neon.Postgres.Versions.v2_preview)
@parentResource(Project)
model Branch is ProxyResource<BranchProperties> {
  ...ResourceNameParameter<
    Resource = Branch,
    KeyName = "branchName",
    SegmentName = "branches",
    NamePattern = "^\\S.{0,62}\\S$|^\\S$"
  >;
}

@doc("Properties specific to Branch")
@added(Neon.Postgres.Versions.v2_preview)
model BranchProperties {
  ...BaseEntity;

  @doc("The ID of the project this branch belongs to")
  projectId?: string;

  @doc("The ID of the parent branch")
  @pattern("^[a-z0-9-]{1,60}$")
  parentId?: string;

  @doc("Role name associated with the branch")
  roleName?: string;

  @doc("Database name associated with the branch")
  databaseName?: string;

  @doc("Roles associated with the branch")
  @Azure.ResourceManager.identifiers(#[])
  roles?: NeonRoleProperties[];

  @doc("Neon Databases associated with the branch")
  @Azure.ResourceManager.identifiers(#[])
  databases?: NeonDatabaseProperties[];

  @doc("Endpoints associated with the branch")
  @Azure.ResourceManager.identifiers(#[])
  endpoints?: EndpointProperties[];
}
