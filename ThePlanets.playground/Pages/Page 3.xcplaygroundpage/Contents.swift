/*:
 # Travel to the Planets
 
Now that we know the names of the planets we can finally visit. You can choose which sequence of planets you want to visit. It is necessary to enter a code on your ship to navigate to the chosen planets. For example, if you want to go to the planets Earth, Jupiter, Uranus, Mercury and Mars, you must enter this code:
 
spaceship.travelTour = ["Earth", "Jupiter", "Uranus","Mercury","Mars"]
 
It is important to write in this order and manner, as your spaceship only understands the coordinates in this way !!.
 - note:
 -> Swipe sideways to see messages from the planets
 -> When you are finished with observations on a planet, move to the side to go to the next
 ---
Write the name of the planets inside the keys and run the code. You will see a page for each chosen planet
 
*/
import PlaygroundSupport
var spaceship = PlanetsCollectionViewController()
spaceship.travelTour = [ ] // Write the planets in these keys 
PlaygroundPage.current.liveView = spaceship
/*:
Wow, what an incredible trip, your crew member Joel Levi was very happy. At this moment you left him on his home planet, but he promised to return one day and take him to know beyond the solar system ...
 
Until any day intergalactic traveler !!!!
*/
