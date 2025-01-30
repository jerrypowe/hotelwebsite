/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModelAdmin;

/**
 *
 * @author HP
 */
public class Service {

    private int id;
    private String name;
    private String description;
    private int Price;
    private String images;

    public Service() {
    }

    public Service(int id, String name, String description, int Price, String images) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.Price = Price;
        this.images = images;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPrice() {
        return Price;
    }

    public void setPrice(int Price) {
        this.Price = Price;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public static boolean isEmpty(Service ser) {
        return ser.getName().isEmpty() && ser.getImages().isEmpty();
    }
}
