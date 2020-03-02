require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutObjects < Neo::Koan
  def test_everything_is_an_object
    assert_equal true, 1.is_a?(Object)
    assert_equal true, 1.5.is_a?(Object)
    assert_equal true, "string".is_a?(Object)
    assert_equal true, nil.is_a?(Object)
    assert_equal true, Object.is_a?(Object)
  end

  def test_objects_can_be_converted_to_strings
    assert_equal "123", 123.to_s
    assert_equal "", nil.to_s
  end

  def test_objects_can_be_inspected
    assert_equal "123", 123.inspect
    assert_equal "nil", nil.inspect
  end

  def test_every_object_has_an_id
    obj = Object.new
    assert_equal Integer, obj.object_id.class
  end

  def test_every_object_has_different_id
    obj = Object.new
    another_obj = Object.new
    assert_equal true, obj.object_id != another_obj.object_id
  end

  def test_small_integers_have_fixed_ids
    assert_equal 1, 0.object_id
    assert_equal 3, 1.object_id
    assert_equal 5, 2.object_id
    assert_equal 201, 100.object_id

    # THINK ABOUT IT:
    # What pattern do the object IDs for small integers follow?
=begin
    from https://stackoverflow.com/a/3430487/10792295:
    In MRI the object_id of an object is the same as the VALUE that represents the object on the C level. For most kinds of objects this VALUE is a pointer to a location in memory where the actual object data is stored. Obviously this will be different during multiple runs because it only depends on where the system decided to allocate the memory, not on any property of the object itself.
    
    However for performance reasons true, false, nil and Fixnums are handled specially. For these objects there isn't actually a struct with the object's data in memory. All of the object's data is encoded in the VALUE itself. As you already figured out the values for false, true, nil and any Fixnum i, are 0, 2, 4 and i*2+1 respectively.
    
    The reason that this works is that on any systems that MRI runs on, 0, 2, 4 and i*2+1 are never valid addresses for an object on the heap, so there's no overlap with pointers to object data.
=end
  end

  def test_clone_creates_a_different_object
    obj = Object.new
    copy = obj.clone

    assert_equal true, obj           != copy
    assert_equal true, obj.object_id != copy.object_id
  end
end
