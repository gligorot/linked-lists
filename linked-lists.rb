#Linked lists project from theodinproject.com
#https://www.theodinproject.com/courses/ruby-programming/lessons/linked-lists

class LinkedList

  def initialize
    #rules are not clear whether these two are allowed/needed or not
    @head = nil
    @tail = nil

  end

  #node class, both value and next_node are set to nil by default
  class Node
    attr_accessor :value, :next_node

    def initialize(value=nil, next_node=nil) #maybe I'll need to add code here
      @value = value
      @next_node = next_node
    end
  end

  #add a new node at end #very unclear in whether to add just an empty node or with data
  def append
    new_node = Node.new

    if @head.nil? #aka list is empty-no nodes at all
      @head = new_node
      @tail = new_node
      @head.next_node = @tail
    #potentially add the elsif (head not nil, tail nil) back
    else
      @tail.next_node = new_node
      @tail = new_node
    end
  end

  end

  #add a new node at start
  def prepend
    new_node = Node.new

    if @head.nil?
      @head = new_node
      @tail = new_node
      @head.next_node = @tail
    else
      new_node.next_node = @head
      @head = new_node
    end
  end

  #return size (number of nodes)
  def size
    if head.nil?
      return 0
    else #or just this below
      count = 1 # remember, array with indexes 0,1,2,3 is size 4 !
      x = @head
      until x.nil? #took out x.next_node.nil?, check later
        count += 1
        x = x.next_node
      end

      return count
    end
  end

  #aka first node
  def head
    return @head
  end

  #aka last  node
  def tail
    return @tail
  end

  #return node at given index (?)
  #can be done with size too, same shit
  def at(index)
    count = 0

    x = @head
    while true #possible work here later
      if count == index
        return x #problem alert
        return
      end
      count += 1

      if x.next_node.nil?
        print "A node at the given index doesn't exist"
        return
      else
        x = x.next_node
      end
    end
  end

  #remove last node (and make the one before it tail)
  def pop
    node_count = self.size

    @tail = self.at(node_count-2) #-2 because of how size works
    @tail.next_node = nil
  end

  #check if value is in the list, return true, else false
  def contains?(given_value)
    self.traverse_list do |node|
      if node.value == given_value
        return true
      else
        return false
      end
    end
  end

  end

  #returns the index of the node whose data(value valjda?) matches the given, else nil
  def find(data)
    #note-there may be a way to extract the count value from traverse_list
    #so I don't need to make a new index counter, but I don't know it
    index = 0
    self.traverse_list do |node|
      return index if node.value == data
      index += 1
    end
  end

  #prints the list elements as strings, format ( data ) -> ( data ) -> ( data ) -> nil
  def to_s
    self.traverse_list do |node|
      print "( #{node.data} ) -> "
    end
    print "nil" #because of how traverse_list works this has to be this way
  end

  #extra credit
  #adds node at the given index
  def insert_at(index)
    prev = self.at(index) #idk how to call this....
    post = self.at(index+1)


  end
  def remove_at(index); end #removes node at the given index

  #extra function for convenience

  #go through the list, start to finish (works with a block)
  def traverse_list
    return self unless block_given?
    count = 0 #technically not needed because i don't know how to "extract" it for outside-of-function-use
    x = @head
    until x.nil?
      count += 1
      yield x
      x = x.next_node
    end
  end

end
list = LinkedList.new
