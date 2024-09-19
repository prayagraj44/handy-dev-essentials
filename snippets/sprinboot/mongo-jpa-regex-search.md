# search a text on a mongodb collection fields via JPA


### via JPA method name conventions

```java
@Repository
public interface PersonRepo extends MongoRepository<Person, String> {

    List<Person> findByNameContainingIgnoreCase(String personName);

}

```

### via custom query

```java
@Repository
public interface PersonRepo extends MongoRepository<Person, String> {
   
    @Query("{ 'name': { $regex: ?0, $options: 'i' } }")
    List<ClientAccess> searchPersonsByNameRegex(String regex);
    
}
```