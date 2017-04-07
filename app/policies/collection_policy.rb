class CollectionPolicy < ApplicationPolicy
    
     def destroy?
      record.user == user
     end
end