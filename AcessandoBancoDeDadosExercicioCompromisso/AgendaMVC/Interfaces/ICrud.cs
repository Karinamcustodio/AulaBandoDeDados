namespace AgendaMVC.Interfaces
{
    public interface ICrud<T>
    {
        bool create(T t);
        bool edit(T t);
        void delete(int id);
        T details(int id);
        List<T> details();
    }
}
