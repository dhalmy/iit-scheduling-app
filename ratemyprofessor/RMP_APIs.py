from supabase import create_client, Client

url = 'https://hojaypiafpzmnznbilgm.supabase.co'
key = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhvamF5cGlhZnB6bW56bmJpbGdtIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5NjE3NDc4NywiZXhwIjoyMDExNzUwNzg3fQ.Ir4xPkfX4N1-l5sAE8TXAftRBy3jJe9jV9Jjk6tcDSw'

class Professor:



    def __init__(self, first, last):
        self.first = first
        self.last = last
        self.rating = -1
        self.difficulty = -1
        self.pwta = -1
        self.numreviews = -1

    def activate(self):
        supabase: Client = create_client(url, key)
        data = supabase.table('ratemyprofessor').select("*").eq('first_name', self.first).eq('last_name', self.last).execute()
        if data.data:
            self.rating = data.data[0]['rating']
            self.difficulty = data.data[0]['difficulty']
            self.pwta = data.data[0]['pwta']
            self.numreviews = data.data[0]['numreviews']
        else:
            print("This professor is not on RMP")

    def getRating(self):
        return self.rating

    def getDifficulty(self):
        return self.difficulty
    
    def getPwta(self):
        return self.pwta

    def getNumreviews(self):
        return self.numreviews

    def printAll(self):
        print("Rating: " + str(self.rating))
        print("Difficulty: " + str(self.difficulty))
        print("Percent of Students That Would Take This Professor Again: " + str(self.pwta))
        print("Number of Reviews: " + str(self.numreviews))


"""example usage
p1 = Professor('Kiah', 'Ong')
p1.activate()
p2 = Professor('Matthew', 'Bauer')
p2.activate()

print(p1.getRating())
print(p2.getNumreviews())
"""

