
enum KeyAPI {
    case getKey(id: String, teamId: String)
    case downloadKey(id: String, teamId: String)
    case createKey(teamId: String, params: [String: String])
    case revokeKey(id: String, teamId: String)
}

