import UIKit
import CoreData

class NoteViewController: UIViewController
{
	@IBOutlet weak var titleTextField: UITextField!
	@IBOutlet weak var descriptionTextField: UITextView!
	
	var selectedNote: Note? = nil
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
		if(selectedNote != nil)
		{
			titleTextField.text = selectedNote?.title
			descriptionTextField.text = selectedNote?.desc
		}
	}


	@IBAction func saveAction(_ sender: Any)
	{
		let appDelegate = UIApplication.shared.delegate as! AppDelegate
		let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext// i craete a value inside the AppDelegate to make the code run
		if(selectedNote == nil)
		{
			let entity = NSEntityDescription.entity(forEntityName: "Note", in: context)//To go to CoreData and use file inside the core
			let newNote = Note(entity: entity!, insertInto: context)
			newNote.id = noteList.count as NSNumber
			newNote.title = titleTextField.text
			newNote.desc = descriptionTextField.text
			do
			{
				try context.save()
				noteList.append(newNote)
				navigationController?.popViewController(animated: true)
			}
			catch
			{
				print("Error")
			}
		}
		else
		{
			let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")//to open again same data and can be edit inside it
			do {
				let results:NSArray = try context.fetch(request) as NSArray
				for result in results
				{
					let note = result as! Note
					if(note == selectedNote)
					{
						note.title = titleTextField.text
						note.desc = descriptionTextField.text
						try context.save()
						navigationController?.popViewController(animated: true)
					}
				}
			}
			catch
			{
				print("Error")
			}
		}
	}
	}

