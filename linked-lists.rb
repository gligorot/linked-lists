#Linked lists project from theodinproject.com
#https://www.theodinproject.com/courses/ruby-programming/lessons/linked-lists

class LinkedList



  def initialize
    #rules are not clear whether these two is allowed/needed or not
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

  def prepend #add a new node at start
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

  def size #return size (number of nodes)
    if head.nil?
      return 0
    elsif head.next_node == @tail
      return 1
    else
      count = 0
      #something along the lines of while X.next_node != nil count += 1 where X is every next node from head
      x = @head
      until x.next_node.nil?
        count += 1
        x = x.next_node
      end

      return count
    end
  end

  def head #aka first node
    return @head
  end

  def tail  #aka last  node
    return @tail
  end

  def at(index) #return node at given index (?)
    count = 0

    x = @head
    while true #possible work here later
      if count == index
        return x
        return
      end
      count += 1
      x = x.next_node

      if x.next_node.nil?
        print "A node at the given index doesn't exist"
        return
      end
    end
  end

  def pop #remove last node
    #MAKE A TRAVERSE FUNCTION <3
  end
  def contains?(value); end #check if value is in the list, return true, else false
  def find(data); end #returns the index of the node whose data(value) matches the given, else nil
  def to_s; end #prints the list elements as strings, format ( data ) -> ( data ) -> ( data ) -> nil
  #extra credit
  def insert_at(index); end #adds node at the given index
  def remove_at(index); end #removes node at the given index
end

list = LinkedList.new
