#Linked lists project from theodinproject.com
#https://www.theodinproject.com/courses/ruby-programming/lessons/linked-lists

#note- find > problem alert for things i need to remember

class LinkedList

  def initialize
    #rules are not clear whether these two are allowed/needed or not
    @head = nil
    @tail = nil

  end

  #node class, both value and next_node are set to nil by default
  class Node
    attr_accessor :value, :next_node

    def initialize(value=nil, next_node=nil)
      @value = value
      @next_node = next_node
    end
  end

  #add a new node at end #very unclear in whether to add just an empty node or with data
  def append
    new_node = Node.new

    if @head.nil? #aka empty list (no nodes)
      @head = new_node
      @tail = new_node
      @head.next_node = @tail
      @tail.next_node = nil #problem alert
    else
      @tail.next_node = new_node
      @tail = new_node
      @tail.next_node = nil #problem alert
    end
  end


  #add a new node at start
  def prepend
    new_node = Node.new

    if @head.nil?
      @head = new_node
      @tail = new_node
      @head.next_node = @tail
      @tail.next_node = nil
    else
      new_node.next_node = @head
      @head = new_node
    end
  end

  #return size (number of nodes)
  def size
    if head.nil?
      return 0
    else
      count = 1 # remember, array with indexes 0,1,2,3 is size 4 !
      x = @head
      until x.next_node.nil? #problem alert
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

  #return node at given index
  def at(index)
    self.traverse_list_with_count do |node, count|
      if count == index
        return node
      elsif count > self.size
        print "A node at the given index doesn't exist"
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

  #returns the index of the node whose data(value valjda?) matches the given, else nil
  def find(data)
    self.traverse_list_with_count do |node, index|
      return index if node.value == data
    end
  end

  #prints the list elements as strings, format ( data ) -> ( data ) -> ( data ) -> nil
  def to_s
    self.traverse_list do |node|
      print "( #{node.value} ) -> "
    end
    print "nil" #because of how traverse_list works this has to be this way
  end

  #extra credit

  #IMPORTANT - head is index 0, tail is last index
  #suport function for insert_at and remove_at
  #IMPORTANT- if i find a way to call self.at for two different selfs this is not needed
  def get_index(index)
    return self.at(index)
  end

  #adds node at the given index
  def insert_at(index, insertion)
    prev = get_index(index)
    post = get_index(index+1)

    #if index of insertion is bigger than list size it will insert at the end
    if prev.nil?
      @tail.next_node = insertion
      @tail = insertion #problem alert
      @tail.next_node = nil
    else
      prev.next_node = insertion
      insertion.next_node = post
    end
  end

  #removes node at the given index
  def remove_at(index)
    if index == 0
      @home = get_index(index+1)
      @home.next_node = get_index(index+2)
    elsif get_index(index) == @tail
      @tail = get_index(index-1)
      @tail.next_node = nil
    else
      prev = get_index(index-1)
      post = get_index(index+1)
      prev.next_node = post
    end
  end

  #extra function for convenience

  #go through the list, start to finish (works with a block)
  def traverse_list
    return self unless block_given?
    x = @head
    until x.nil?
      yield x
      x = x.next_node
    end
  end

  #yields x and count
  def traverse_list_with_count
    return self unless block_given?
    count = 0
    x = @head
    until x.nil?
      yield x, count
      count += 1
      x = x.next_node
    end
  end

  def create_node(value)
    return Node.new(value)
  end

end
list = LinkedList.new
list.append
list.append
list.append
puts list.to_s
puts print "size-", list.size
new_node = list.create_node("123")
new_node2 = list.create_node("456")
list.insert_at(0, new_node)
puts list.to_s
puts print "size-", list.size
list.insert_at(2, new_node2)
puts list.to_s
puts print "size-", list.size
list.remove_at(3)
puts list.to_s
puts print "size-", list.size
list.prepend
puts list.to_s
puts print "size-", list.size
list.pop
puts list.to_s
puts print "size-", list.size
puts list.head
puts list.at(0)
puts list.tail
puts list.at(3)
puts list.find("123")
puts list.find("456")

#everything works as expected...gg
