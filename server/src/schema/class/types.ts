export const ClassesTypes = `#graphql
  type Class {
    id: ID!
    index: String!
    name: String!
    hit_die: Int!
    proficiencies: [Proficiency!]!
    saving_throws: [SavingThrow!]!
    starting_equipment: [StartingEquipment!]!
    spellcasting: Spellcasting
    subclasses: [Subclass!]!
    multi_classing: MultiClassing
  }

  type Proficiency {
    id: ID!
    index: String!
    name: String!
    url: String!
  }

  type SavingThrow {
    id: ID!
    index: String!
    name: String!
    url: String!
  }

  type StartingEquipment {
    id: ID!
    equipment: JSON!
    quantity: Int!
  }

  type Spellcasting {
    id: ID!
    level: Int!
    spellcasting_ability: JSON!
    info: JSON!
  }

  type MultiClassing {
    id: ID!
    prerequisites: JSON!
    proficiencies: JSON!
  }

  type Subclass {
    id: ID!
    index: String!
    name: String!
    url: String!
  }
`;