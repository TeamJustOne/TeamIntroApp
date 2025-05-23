import Foundation

protocol TeamMemberRepository {
    func fetchTeamMembers() throws -> [TeamMember]
    func fetchTeamMember(by name: String) throws -> TeamMember?
}

final class TeamMemberRepositoryImpl: TeamMemberRepository {
    private let jsonFileName = "members"
    
    func fetchTeamMembers() throws -> [TeamMember] {
        guard let url = Bundle.main.url(forResource: jsonFileName, withExtension: "json") else {
            throw RepositoryError.fileNotFound
        }
        
        let data = try Data(contentsOf: url)
        let teamMembers = try JSONDecoder().decode([TeamMember].self, from: data)
        return teamMembers
    }
    
    func fetchTeamMember(by name: String) throws -> TeamMember? {
        let teamMembers = try fetchTeamMembers()
        return teamMembers.first { $0.name == name }
    }
}

enum RepositoryError: Error {
    case fileNotFound
    case decodingError
    case unowned
}
