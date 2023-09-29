
import CoreData

@objc(Note)
class Note: NSManagedObject//this file to choose the Type of Data in the Core and let have value for each one
{
	@NSManaged var id: NSNumber!
	@NSManaged var title: String!
	@NSManaged var desc: String!
	@NSManaged var deletedDate: Date?
}
